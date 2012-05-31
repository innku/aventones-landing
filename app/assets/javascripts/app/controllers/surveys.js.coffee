$ = jQuery.sub()
Survey = App.Survey

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Survey.find(elementID)

class New extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'
    
  constructor: ->
    super
    @active @render
    
  render: ->
    @html @view('surveys/new')

  back: ->
    @navigate '/surveys'

  submit: (e) ->
    e.preventDefault()
    survey = Survey.fromForm(e.target).save()
    @navigate '/surveys', survey.id if survey

class Edit extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'
  
  constructor: ->
    super
    @active (params) ->
      @change(params.id)
      
  change: (id) ->
    @item = Survey.find(id)
    @render()
    
  render: ->
    @html @view('surveys/edit')(@item)

  back: ->
    @navigate '/surveys'

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(e.target).save()
    @navigate '/surveys'

class Show extends Spine.Controller
  events:
    'click [data-type=edit]': 'edit'
    'click [data-type=back]': 'back'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = Survey.find(id)
    @render()

  render: ->
    @html @view('surveys/show')(@item)

  edit: ->
    @navigate '/surveys', @item.id, 'edit'

  back: ->
    @navigate '/surveys'

class Index extends Spine.Controller
  events:
    'click [data-type=edit]':    'edit'
    'click [data-type=destroy]': 'destroy'
    'click [data-type=show]':    'show'
    'click [data-type=new]':     'new'

  constructor: ->
    super
    Survey.bind 'refresh change', @render
    Survey.fetch()
    
  render: =>
    surveys = Survey.all()
    @html @view('surveys/index')(surveys: surveys)
    
  edit: (e) ->
    item = $(e.target).item()
    @navigate '/surveys', item.id, 'edit'
    
  destroy: (e) ->
    item = $(e.target).item()
    item.destroy() if confirm('Sure?')
    
  show: (e) ->
    item = $(e.target).item()
    @navigate '/surveys', item.id
    
  new: ->
    @navigate '/surveys/new'
    
class App.Surveys extends Spine.Stack
  controllers:
    index: Index
    edit:  Edit
    show:  Show
    new:   New
    
  routes:
    '/surveys/new':      'new'
    '/surveys/:id/edit': 'edit'
    '/surveys/:id':      'show'
    '/surveys':          'index'
    
  default: 'index'
  className: 'stack surveys'