const pay = () => {

  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    document.getElementById("purchase_address[postal_code]").removeAttribute("name");
    document.getElementById("purchase_address[region_id]").removeAttribute("name");
    document.getElementById("purchase_address[city]").removeAttribute("name");
    document.getElementById("purchase_address[address_number]").removeAttribute("name");
    document.getElementById("purchase_address[house_name]").removeAttribute("name");
    document.getElementById("purchase_address[phone_number]").removeAttribute("name");

  };