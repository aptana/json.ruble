require 'ruble'

bundle 'JSON' do |bundle|
  bundle.author = 'James Edward Gray II'
  bundle.contact_email_rot_13 = 'wnzrf@tenlcebqhpgvbaf.arg'
  bundle.description =  <<END
Syntax highlight for <a href="http://json.org/">JavaScript Object Notation</a> files, often used as a lightweight serialization format.
END
  start_folding = /(?x:^\s*[{\[](?!.*[}\]],?\s*$)|[{\[]\s*$)/
  end_folding = /(?x:^\s*[}\]])/
  bundle.folding['source.json'] = start_folding, end_folding
  bundle.register_file_type('*.json', 'source.json')

  bundle.menu 'JSON' do |main_menu|
    main_menu.scope = [ 'source.json' ]
#    main_menu.command '0C3868E4-F96B-4E55-B204-1DCB5A20748B'
    main_menu.command 'Reformat Document / Selection'
  end
end
