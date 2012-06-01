$ = jQuery.sub()
Survey = App.Survey

class New extends Spine.Controller
  events:
    'submit form': 'submit'

  constructor: ->
    super
    @active @render

  render: ->
    @html @view('surveys/new')

  submit: (e) ->
    e.preventDefault()
    email = $(e.target).find('input').val()
    survey = Survey.fromJSON({
      email: email,
      would_charge: null,
      would_pay: null
    }).save()

    #@navigate '/surveys', survey.id, 'would_charge' if survey
    @navigate '/surveys', survey.id, 'would_pay' if survey


class WouldCharge extends Spine.Controller
  events:
    'click [data-type=yes]': 'yes'
    'click [data-type=no]': 'no'

  constructor: ->
    super
    @active (params) ->
      @item = Survey.find(params.id)
      @render()

  render: ->
    @html @view('surveys/would_charge')

  yes: ->
    @item.would_charge = 'yes'
    @item.save()
    @html @view('surveys/thankyou')

  no: ->
    @item.would_charge = 'no'
    @item.save()
    @html @view('surveys/noproblem')


class WouldPay extends Spine.Controller
  events:
    'click [data-type=yes]':   'yes'
    'click [data-type=maybe]': 'maybe'
    'click [data-type=no]':    'no'

  constructor: ->
    super
    @active (params) ->
      @item = Survey.find(params.id)
      @render()

  render: ->
    @html @view('surveys/would_pay')

  yes: ->
    @item.would_pay = 'yes'
    @item.save()
    @html @view('surveys/thankyou2')

  maybe: ->
    @item.would_pay = 'maybe'
    @item.save()
    @html @view('surveys/thankyou2')

  no: ->
    @item.would_pay = 'no'
    @item.save()
    @html @view('surveys/thankyou2')



class App.Surveys extends Spine.Stack
  controllers:
    new:          New
    would_pay:    WouldPay
    would_charge: WouldCharge

  routes:
    '/surveys':                  'new'
    '/surveys/:id/would_charge': 'would_charge'
    '/surveys/:id/would_pay':    'would_pay'

  default: 'new'
  className: 'stack surveys'
