import type { APIRoute } from 'astro';
import { Resend } from 'resend';

const resend = new Resend(import.meta.env.RESEND_API_KEY);

export const POST: APIRoute = async ({ request }) => {
  try {
    const data = await request.json();
    const { name, email, subject, message } = data;

    // Input validation
    if (!name || !email || !subject || !message) {
      return new Response(
        JSON.stringify({
          error: 'Missing required fields'
        }),
        { status: 400 }
      );
    }

    // Send notification email to admin
    const adminEmail = await resend.emails.send({
      from: 'LowCal Kitchen <contact@lowcalkitchen.com>',
      to: 'admin@lowcalkitchen.com', // Change this to your admin email
      subject: `New Contact Form Submission: ${subject}`,
      html: `
        <h2>New Contact Form Submission</h2>
        <p><strong>From:</strong> ${name} (${email})</p>
        <p><strong>Subject:</strong> ${subject}</p>
        <p><strong>Message:</strong></p>
        <p>${message}</p>
      `
    });

    // Send confirmation email to user
    const userEmail = await resend.emails.send({
      from: 'LowCal Kitchen <contact@lowcalkitchen.com>',
      to: email,
      subject: 'Thank you for contacting LowCal Kitchen',
      html: `
        <h2>Thank you for reaching out!</h2>
        <p>Dear ${name},</p>
        <p>We've received your message and will get back to you as soon as possible.</p>
        <p>Here's a copy of your message:</p>
        <hr>
        <p><strong>Subject:</strong> ${subject}</p>
        <p><strong>Message:</strong></p>
        <p>${message}</p>
        <hr>
        <p>Best regards,<br>LowCal Kitchen Team</p>
      `
    });

    return new Response(
      JSON.stringify({
        message: 'Emails sent successfully',
        adminEmailId: adminEmail.id,
        userEmailId: userEmail.id
      }),
      { status: 200 }
    );
  } catch (error) {
    console.error('Error sending email:', error);
    return new Response(
      JSON.stringify({
        error: 'Failed to send email'
      }),
      { status: 500 }
    );
  }
} 