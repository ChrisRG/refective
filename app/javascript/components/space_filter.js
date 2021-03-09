import $ from "jquery";
import "select2";

const initSelect2 = () => {
  const filter = $("#select-item-type-id");
  filter.select2();
  return filter;
};

const clearFilter = () => {
  document.querySelectorAll(".space-partial").forEach((space) => {
    space.classList.remove("d-none");
  });
};

const filterSpaces = (id) => {
  if (!id) {
    return clearFilter();
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
  const filter = initSelect2();

  filter.on("select2:select", (e) => {
    const id = e.currentTarget.value;
    console.log(id);
    filterSpaces(id);
  });
};

export { initSpacesFilter };
