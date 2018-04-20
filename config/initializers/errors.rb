require 'net/smtp'

SMTP_SERVER_ERRORS = [
  IOError,
  Net::SMTPAuthenticationError,
  Net::SMTPServerBusy,
  Net::SMTPUnknownError,
  TimeoutError
].freeze

SMTP_CLIENT_ERRORS = [Net::SMTPFatalError, Net::SMTPSyntaxError].freeze
