const filterSpaces = (id) => {
  if (!id) {
    return;
  }
  id = parseInt(id, 10);
  document.querySelectorAll(".space-partial").forEach((space) => {
    const itemTypeIds = JSON.parse(space.dataset.itemTypeIds);
    if (itemTypeIds.includes(id)) {
      space.classList.remove("d-none");
    } else {
      space.classList.add("d-none");
    }
  });
};

const initSpacesFilter = () => {
  const filter = document.getElementById("select-item-type-id");
  filter.addEventListener("change", (e) => {
    const id = e.currentTarget.value;
    filterSpaces(id);
  });
};

export { initSpacesFilter };
