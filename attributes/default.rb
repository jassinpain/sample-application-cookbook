
=begin
node.set['java']['jdk_version'] = "7"
# fore re-evaluation of the java default attributes (see CHEF-4234)
node.from_file(run_context.resolve_attribute("java", "default"))
=end

node.default['sample_app']['words_of_wisdom'] = "I can haz cats!"