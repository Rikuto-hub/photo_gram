import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {

  const dataset = $('#article-show').data()
  const articleId = dataset.articleId

  $('.show_comment_form').on('click', () => {
    $('.show_comment_form').addClass('hidden')
    $('.comment_text_area').removeClass('hidden')
  })  

  axios.get(`/articles/${articleId}/comments`)
  .then((response) => {
    const comments = response.data
    comments.forEach((comment) => {
      $('.comment_container').append(
        `<div class="article_comment"><p>${comment.content}</p></div>`
      )
    })
  })

  $('.add_comment_button').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('コメントを入力してください')
    } else {
      axios.post(`/articles/${articleId}/comments`, {
        comment: {content: content}
      })
      .then((res) => {
        console.log(res)
        const comment = res.data
        $('.comment_container').append(
          `<div class="article_comment"><p>${comment.content}</p></div>`
        )
        $('#comment_content').val('')
      })
    }
  })
  
})