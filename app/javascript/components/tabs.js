const triggerTabs = () => {
  const triggerTabList = [].slice.call(
    document.querySelectorAll("#myTab button")
  );

  triggerTabList.forEach((triggerEl) => {
    const tabTrigger = new bootstrap.Tab(triggerEl);

    triggerEl.addEventListener("click", (event) => {
      event.preventDefault();
      tabTrigger.show();
    });
  });
};
export { triggerTabs };
