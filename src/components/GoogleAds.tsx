import React, { useEffect } from 'react';

declare global {
  interface Window {
    adsbygoogle: any[];
  }
}

interface GoogleAdsProps {
  slot: string;
  format?: 'auto' | 'fluid' | 'rectangle';
  responsive?: boolean;
  style?: React.CSSProperties;
}

export default function GoogleAds({ slot, format = 'auto', responsive = true, style }: GoogleAdsProps) {
  useEffect(() => {
    try {
      (window.adsbygoogle = window.adsbygoogle || []).push({});
    } catch (error) {
      console.error('Error loading Google Ads:', error);
    }
  }, []);

  // Get AdSense client ID from environment variable
  const adClient = import.meta.env.PUBLIC_ADSENSE_CLIENT_ID;

  return (
    <div className="google-ads-container my-4 md:my-8">
      <ins
        className="adsbygoogle"
        style={style || { display: 'block' }}
        data-ad-client={adClient}
        data-ad-slot={slot}
        data-ad-format={format}
        data-full-width-responsive={responsive}
      />
    </div>
  );
}