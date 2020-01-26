class SlackSignIn::Result
  def initialize(result)
    @result = result || {"error" => "invalid_request"}
  end

  def successful?
    result.key? "success"
  end

  def identity
    return unless successful?

    SlackSignIn::Identity.new(result["success"])
  end

  def error
    result["error"]
  end

  private

  attr_reader :result
end
