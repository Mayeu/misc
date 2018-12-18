# Fix wordpress export.

We had a tumblr blog that we migrated to WordPress.com (because our self-hosted
WordPress was failling to import it.) And the XML export from WP.com did not
contain `<title>` for a lot of images entries, this led the reimport to
ignore those image since the script thought the images were already imported.

This script read a WP.com dump, search for those attachments without `<title>`,
and use the filename (last section of the URL) as a title, and write the fixed
XML on `STDOUT`. This assumes that each filename is unique (it is the case if it
is an import from Tumblr.)
