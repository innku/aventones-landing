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

    @navigate '/surveys', survey.id, 'would_charge' if survey


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




class App.Surveys extends Spine.Stack
  controllers:
    new:          New
    would_charge: WouldCharge

  routes:
    '/surveys':                  'new'
    '/surveys/:id/would_charge': 'would_charge'

  default: 'new'
  className: 'stack surveys'
