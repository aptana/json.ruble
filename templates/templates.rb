require 'ruble'

template "JSON Template" do |t|
  t.filetype = "*.json"
  t.invoke do |context|
    ENV['TM_DATE'] = Time.now.strftime("%Y-%m-%d")
    raw_contents = IO.read("#{ENV['TM_BUNDLE_SUPPORT']}/../templates/template.json")
    raw_contents.gsub(/\$\{([^}]*)\}/) {|match| ENV[match[2..-2]] }
 end
end