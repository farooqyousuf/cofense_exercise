class HostedLandingPageHome < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.hlp.homepage)
  end
 
end
