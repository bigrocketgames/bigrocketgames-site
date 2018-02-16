jQuery(document).on 'turbolinks:load', ->
  comments = $('#comments')
  App.comments = App.cable.subscriptions.create { 
    channel: "CommentsChannel" 
    post_slug: comments.data('post-slug')
  },
    connected: ->

    disconnected: ->

    received: (data) ->
      comments.prepend(data)