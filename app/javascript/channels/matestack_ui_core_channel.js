import consumer from "./consumer"
import MatestackUiCore from 'matestack-ui-core'

consumer.subscriptions.create("MatestackUiCoreChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    MatestackUiCore.matestackEventHub.$emit(data.event, data)
  }
});
