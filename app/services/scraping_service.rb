# frozen_string_literal: true

class ScrapingService
  def initialize
    self.page = fetch_page
  end

  def sources_list
    rows = page.css('#page table tr')[1..-1]

    rows
      .map { |row| get_source_record(row: row) }
      .select { |source| source[:address].present? }
  end

  private

  URL = 'https://www.raspbian.org/RaspbianMirrors'
  ADDRESS_REGEX = %r{http.*:\/\/([\w.\-\/]*)}

  attr_accessor :page

  def fetch_page
    response = Faraday.get(URL)
    Nokogiri::HTML(response.body)
  end

  def parse_http_address(address)
    return if address.blank?

    result = ADDRESS_REGEX.match(address)
    result ? 'http://' + result[1] : address
  end

  def get_source_record(row:)
    tds = row.css('td')

    {}.tap do |source|
      source = set_continent_and_ipv6(source: source, tds: tds)
      source[:country] = get_td_content(tds[1])
      source[:mirror] = get_td_content(tds[2])
      source[:address] = parse_http_address(get_td_content(tds[3]))
      source[:issues] = get_td_content(tds[4])&.strip
    end
  end

  def get_td_content(td_dom)
    td_dom&.at_css('p')&.content
  end

  def set_continent_and_ipv6(source:, tds:)
    source[:continent] = get_td_content(tds[0])
    if source[:continent][-1] == '*'
      source[:continent] = source[:continent][0..-2]
      source[:ipv6] = true
    end
    source
  end
end
