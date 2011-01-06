require 'test/unit'
require 'mocha'
require 'fakeweb'
require 'stringio'

$:.unshift(File.join(File.dirname(__FILE__), '../lib'))

require 'currency_switcher'

def mock_usd_to_gbp
  File.open('html/usd_to_gbp.html').read
end

def mock_eur_to_usd
  File.open('html/eur_to_usd.html').read
end

def output
  stdout_org = $stdout
  new_stdout = StringIO.new
  $stdout = new_stdout

  yield if block_given?
  $stdout = stdout_org
  new_stdout.string
end