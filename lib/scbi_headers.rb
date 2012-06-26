$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'scbi_headers/scbi_header'

module ScbiHeaders
   VERSION = '0.0.2'
end
