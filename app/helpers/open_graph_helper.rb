module OpenGraphHelper
  def og_site_name
    og_title
  end

  def og_title
    'Favtile'
  end

  def og_description
    <<EOD
Favtile displays your favorited tweets look like tile.
You can see favorited tweets of others by click the icon of others.
Also you can add favorite tweet easy by fav button on the toolbar.
EOD
  end

  def og_url
    # TODO: move to settings
    'http://favtile.com/'
  end

  def og_image
    'http://favtile.com/og-thumb.png'
  end

  def og_type
    'website'
  end

  def fb_admins
    'hanachin'
  end
end
