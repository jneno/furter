class DetailPage
  include Furter

  text(:text_placeholder, :placeholder => 'First Field')
  text(:text_label, :label => 'textByLabel')

  button(:button_text, :text => 'Some Button')
  button(:button_label, :label => 'labeledButtonId')
  button(:go_elsewhere, :text => 'Go Elsewhere')

  switch(:switch_toggle, :label => 'switchToggle')
end
