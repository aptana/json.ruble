require 'ruble'

bundle do |bundle|
  bundle.author = 'Christopher Williams'
  bundle.copyright = "Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.repository = "git://github.com/aptana/json.ruble.git"
  bundle.display_name = t(:bundle_name)
  bundle.description = 'JSON bundle ported from James Edward Gray II\'s TextMate bundle. Syntax highlight for <a href="http://json.org/">JavaScript Object Notation</a> files, often used as a lightweight serialization format.'

  bundle.menu t(:bundle_name) do |main_menu|
    main_menu.scope = [ 'source.json' ]
#    main_menu.command '0C3868E4-F96B-4E55-B204-1DCB5A20748B'
    main_menu.command t(:reformat)
  end
end
