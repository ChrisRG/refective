const scrollToChatBottom = () => {
    const msgDiv = document.getElementById("messages");
    if (msgDiv) {
        msgDiv.scrollTop = msgDiv.scrollHeight;
    }
};  

export { scrollToChatBottom };
