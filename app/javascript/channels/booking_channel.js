import consumer from "./consumer";
import { scrollToChatBottom } from "../components/chat_scroll";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "BookingChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        scrollToChatBottom();
      },
    });
  }
}

export { initChatroomCable };
