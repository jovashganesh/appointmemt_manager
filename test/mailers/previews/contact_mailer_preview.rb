# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  ContactMailer.contact_email("bob@me.com","Bob", "1234567890", @message = "Hello")
end
