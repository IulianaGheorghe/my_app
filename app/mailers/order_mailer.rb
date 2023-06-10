class OrderMailer < ApplicationMailer
  require 'wicked_pdf'
  layout 'mailer'
  default from: "orders@ppostera.com"
  def send_email(user, order)
    @product = order.product
    @order = order
    attachments['invoice.pdf'] = generate_pdf_invoice
    mail(to: user.email, subject: 'Order Placed!')
  end
  private

    def generate_pdf_invoice
      pdf = WickedPdf.new.pdf_from_string(
        render_to_string(
            template: 'order_mailer/invoice_pdf'
        )
      )
      pdf
    end
end
