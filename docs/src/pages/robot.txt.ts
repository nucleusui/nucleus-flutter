import type { APIRoute } from 'astro';

const getRobotsTxt = (sitemapURL: URL) => `
User-agent: *
Allow: /

Sitemap: ${sitemapURL.href}
`;

export const GET: APIRoute = ({ site }) => {
  if (!site) {
    return new Response('User-agent: *\nAllow: /');
  }
  
  try {
    const sitemapURL = new URL('sitemap-index.xml', site);
    return new Response(getRobotsTxt(sitemapURL));
  } catch (error) {
    console.error('Error generating robots.txt:', error);
    return new Response('User-agent: *\nAllow: /', {
      status: 200,
      headers: { 'Content-Type': 'text/plain' }
    });
  }
};