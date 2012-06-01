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
    survey = Survey.fromJSON({email:email, would_charge:null, would_pay:null}).save()
    @navigate '/surveys', survey.id if survey

class App.Surveys extends Spine.Stack
  controllers:
    new:   New

  routes:
    '/surveys':          'new'

  default: 'new'
  className: 'stack surveys'
