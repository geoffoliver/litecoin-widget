# this is the shell command that gets executed every time this widget refreshes
command: "curl -s https://api.coinmarketcap.com/v1/ticker/litecoin/"

# the refresh frequency in milliseconds
refreshFrequency: 60000

render: (o) ->
  @count = 0
  """
    <div class='box'>
      <div class='btc'>1 LTC</div>
      <div class='prices'>
      </div>
    </div>
  """

update: (output, domEl) ->

  box = $(domEl).find('.box')

  data = JSON.parse(output)[0]

  console.log(data);

  price = parseInt(data['price_usd'])
  content = """
    <div class='price'>$ #{price}</div>
    <div class='currency'>USD</div>
  """

  $(box).find('.prices').html content

style: """
  top: 50%
  left: 10px
  color: white
  font-family: 'Helvetica Neue'
  font-weight: 100
  text-align: left
  margin: -50px 0 0
  text-align: center
  background: rgba(255, 255, 255, 0.1)
  min-width: 130px

  .box
    padding: 3px
    border: 1px solid #FFF
    font-size: 24px
    padding: 5px 10px

    .price
      font-size: 32px

    .btc
      text-align: left

    .currency
      text-align: right

    .currency, .btc
      font-size: 10px
      font-weight: 500
      letter-spacing: 1px
"""
