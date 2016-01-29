class InvitationProvidersPage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.marketplace.email_invitation_providers)
  end

end
