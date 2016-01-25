class BatchInvitationPage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.marketplace.email_batch_invitations)
  end

  def fill_in_incorrect_email
    fill_in("batch_invitation_emails",:with => "the wookie boogie")
  end

  def fill_in_correct_email(emails)
    fill_in("batch_invitation_emails",:with => emails)
  end
end
