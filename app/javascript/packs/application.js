// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./stylesheets/application.scss"

Rails.start()
ActiveStorage.start()

import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'

import MatestackUiCore from 'matestack-ui-core'

let matestackUiApp = undefined

document.addEventListener('DOMContentLoaded', () => {
  matestackUiApp = new Vue({
    el: "#matestack-ui",
    store: MatestackUiCore.store
  })
})
