Barista.configure do |c|
  c.bare!
  c.verbose = false
  c.change_output_prefix! 'shuriken',  'vendor/shuriken'
  c.change_output_prefix! 'youthtree', 'vendor/youthtree'
end