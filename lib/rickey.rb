require "rickey/version"
require "excon"
require "json"
require "date"

class Rickey
  def initialize(date: Date.today, sport_code: "mlb", team_id: nil)
    @date = date
    @sport_code = sport_code
    @team_id = team_id
  end

  def fetch
    if transactions_exist?
      transactions
    else
      []
    end
  end

  protected

  attr_reader :date, :sport_code, :team_id

  private

  def transactions
    api_response["transaction_all"]["queryResults"]["row"]
  end

  def transactions_exist?
    api_response["transaction_all"]["queryResults"]["totalSize"].to_i > 0
  end

  def api_response
    @api_response ||= JSON.parse(
      connection.get(
        path: "/lookup/json/named.transaction_all.bam",
        query: query_params,
        headers: {}
      ).body
    )
  end

  def connection
    Excon.new("http://mlb.com", omit_default_port: true)
  end

  def date_query_param
    date.strftime("%Y%m%d")
  end

  def query_params
    {
      start_date: date_query_param,
      end_date: date_query_param,
      sport_code: "'#{sport_code}'",
      team_id: team_id
    }.reject { |_k, v| v.nil? }
  end
end
