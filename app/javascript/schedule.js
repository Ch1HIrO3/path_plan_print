document.addEventListener("DOMContentLoaded", function() {
  const addSummaryButton = document.getElementById("add-summary-btn");
  const summariesContainer = document.getElementById("summaries-container");

  addSummaryButton.addEventListener("click", function(event) {
    event.preventDefault();
    appendSummaryForm(summariesContainer);
  });

  function appendSummaryForm(container) {
    const newSummaryForm = document.createElement("div");
    newSummaryForm.classList.add("summary-form");
    newSummaryForm.innerHTML = `
      <input type="text" name="schedule[summaries_attributes][new_summary][title]" placeholder="例）持ち物・参加者名" class="form-group">
      <textarea name="schedule[summaries_attributes][new_summary][content]" placeholder="内容" class="form-group"></textarea>
    `;
    container.appendChild(newSummaryForm);
  }

  const addPlanButton = document.getElementById("add-plan-btn");
  const plansContainer = document.getElementById("plans-container");

  addPlanButton.addEventListener("click", function(event) {
    event.preventDefault();
    appendPlanForm(plansContainer);
  });

  function appendPlanForm(container) {
    const newPlanForm = document.createElement("div");
    newPlanForm.classList.add("plan-form");
    newPlanForm.innerHTML = `
      <input type="text" name="schedule[hoge_attributes][new_plan][title]" placeholder="タイトル" class="form-group">
      <textarea name="schedule[hoge_attributes][new_plan][description]" placeholder="説明" class="form-group"></textarea>
      `;
    container.appendChild(newPlanForm);
  }

  const addDateButton = document.getElementById("add-date-btn");
  const plansContainerDate = document.getElementById("plans-container");

  addDateButton.addEventListener("click", function(event) {
    event.preventDefault();
    appendDateForm(plansContainerDate);
  });

  function appendDateForm(container) {
    const newDateForm = document.createElement("div");
    newDateForm.classList.add("date-form");
    newDateForm.innerHTML = `
    <input type="date" name="schedule[hoge_attributes][new_plan][date]" placeholder="" class="form-group">
    <input type="text" name="schedule[hoge_attributes][new_plan][title]" placeholder="タイトル" class="form-group">
    <textarea name="schedule[hoge_attributes][new_plan][description]" placeholder="説明" class="form-group"></textarea>
    `;
    container.appendChild(newDateForm);
  }

  const createBookmarkButton = document.querySelector(".schedule_btn");

  createBookmarkButton.addEventListener("click", function(event) {
    event.preventDefault();
    const form = document.querySelector("form");
    const formData = new FormData(form);
    const xhr = new XMLHttpRequest();
    xhr.open("POST", form.action);
    xhr.setRequestHeader("X-CSRF-Token", document.querySelector("meta[name='csrf-token']").getAttribute("content"));
    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          console.log("Bookmark created successfully!");
          // 保存成功時の処理を追加する場合はここに記述します。
        } else {
          console.error("Failed to create bookmark");
          // 保存失敗時の処理を追加する場合はここに記述します。
        }
      }
    };
    xhr.send(formData);
  });
});
