// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require jquery.mask
//= require popper 
//= require bootstrap
//= bootstrap
//= require rails_emoji_picker
//= require lodash
//= require_tree .

$(document).on('turbolinks:load', function() {  
  $(".toggle-password").click(togglePassClick);
  window.onload = function(){
    const elem = document.getElementById("comment_edit");
    const comment = new CommentTextField(elem,  {
      width: "200px",
      maxLines: 3,
      placeholder: "Введите текст"
  });
  };
  // $(".comment").on('click', function() {
  //     $(this).appendChild(comment.getNode());
  // });
  $('#user_password').keyup(function() {
    const pass = $('#user_password').val();
    const submit = document.getElementById("create_password");
    submit.disabled = pass.length < 8 || pass.match(/\d/i) == 0;
    if (pass.length >= 8) {
      $("#check_simbol").addClass('text-success');
    } else {
      $("#check_simbol").removeClass('text-success');
    }
    if (pass.match(/\d/i) > 0) {
      $("#check_integer").addClass('text-success');
    } else {
      $("#check_integer").removeClass('text-success');
    }
    if (pass.match(/\d/i) > 0 && pass.length >= 8) {
      $("#create_password").addClass('send-information');
      $("#create_password").removeClass('block-send-information');
    } else {
      $("#create_password").removeClass('send-information');
      $("#create_password").addClass('block-send-information');
    }
  });
});

function togglePassClick() {
  $(this).toggleClass("fa-eye fa-eye-slash");
  const input = $($(this).attr("toggle"));
  if (input.attr("type") == "password") {
    input.attr("type", "text");
  } else {
    input.attr("type", "password");
  }
}

class CommentTextField {
  constructor(el, props) {
    // Чтобы потом не копаться каким может быть props сразу отгружу необходиммые поля, 3 след. строки
    const placeholder = props.placeholder || '';
    const width = props.width || this.el.offsetWidth;
    this.maxLines = props.maxLines || 50;
    this.el = this.replaceBaseElement(el); // Вызов заменяет и возвращает полученный объект
    this.el.insertAdjacentHTML('afterbegin', this.render()); // Добавляю html сразу в DOM в начало внутреннего тега
    this.elText = this.el.querySelector('.comment-control-text'); // Сохраняю ссылку на тектовое поле элемента
    this.elText.style.wordWrap = true; // Говорю что ему надо будет переносить вниз слитные строки, т.е. ставить перенос строки там, где нет пробелов, это если по простому
    this.elText.setAttribute('placeholder', placeholder); // Задаю текст для пустого объекта, смотрите css
    this.adjustWidth(width); // Ставлю ширину объектам которые для меня важны, т.е. те которым важна ширина
    this.handleHeightChange(); // Здесь добавляю слушателя на изменение высоты и если мы достигаем предрасчитаного максимума, то добавляем скролл к текстовому полю
    this.handleFocusShowButtons(); // Очень простой фейд-оут для нижних контролок в футере
  }

  replaceBaseElement(el) { // метод замены базовго элемента
    const parent = el.parentElement; // получаю родителя базового объекта
    const divControl = document.createElement('div'); // создаю элемент ДИВ, чтобы заменить им базовый в DOM
    divControl.id = "comment-control-" + el.id + "-wrapper"; // накидываю свой id основываясь на базовом, тут не принициально, но с одной стороны, лучше оставить старый id
    parent.replaceChild(divControl, el); // замена объекта полностью в ту же позицию в DOM
    return divControl; // возвращаю полученый объект
  }

  adjustWidth(width) { // метод выставления широт
    this.el.style.width = width; // задание ширины обертке
    this.elText.style.width = width; // задание ширины текстовому полю
  }

  handleHeightChange() { // метод слушания изменения высоты
    // расчет необходимых отступов, не достаточно мягко получился, надо будет проверять почему
    const fonSize = parseInt(window.getComputedStyle(this.elText).fontSize);
    const paddings = parseInt(window.getComputedStyle(this.elText).paddingTop) + parseInt(window.getComputedStyle(this.elText).paddingBottom);
    const borders = parseInt(window.getComputedStyle(this.elText).borderTop) + parseInt(window.getComputedStyle(this.elText).borderBottom);
    this.heightMax = (fonSize * this.maxLines) + (paddings + borders);
    this.lettersInField = 0; // очень важный объект, благодаря нему мы узнали когда перешли на css со скролом, надо проверить, можно ли его сломать, если вставлять текст в середину после добавления скролла
    this.elText.onkeyup = (k) => { // подписываюсь на событие после нажатия, это важно, т.к. вставка уже была проделана и высота уже изменилась
      if (this.lettersInField > 0 && 
          this.lettersInField <= this.elText.innerText.length) // проверка что мы не стирали символы
          return;
      
      if (this.elText.offsetHeight > this.heightMax 
          && this.lettersInField === 0) { // тут проверяем что мы еще не добавили скролл 
          this.lettersInField = this.elText.innerText.length; // сохранение кол-ва символов которые нарушили высотные границы
          this.elText.style.height = this.heightMax; // установление строгого значения высоты
          this.elText.style.overflowY = "scroll"; // добавление скролла
      } else {
          this.lettersInField = 0; // убираем значение кол-ва символов, чтобы наши условия выполнялись корректно
          this.elText.style.height = ""; // убираем строгое значение высоты
          this.elText.style.overflowY = ""; // убираем скролл
      }
    };
  }

  handleFocusShowButtons() { // добавление выплывания футера 
    this.elFooter = this.el.querySelector('.comment-control-footer'); // создаю ссылку для доступа к объекту подвала
    // прячу ее классическим методом
    this.elFooter.style.visibility = "hidden"; 
    this.elFooter.style.display = "gone";
    this.elText.onfocus = () => { // когда наш объект получает фокус на себе
      // возвращаю настройки видимости подвалу
      this.elFooter.style.visibility = "visible";
      this.elFooter.style.display = "block";
      this.el.querySelector('.comment-control-footer').style.opacity = 1; // убираю полную прозрачность, на полное видение
    };
    this.elText.onblur = () => { // когда фокус был потерян
      // прячу подвал классическим методом
      this.elFooter.style.visibility = "hidden";
      this.elFooter.style.display = "gone";
      this.el.querySelector('.comment-control-footer').style.opacity = 0; // добавляю полную прозрачность
    };
  }

  render() { // так выглядит html внутри нашей обертки
    return `<div class='comment-control-header'></div>
            <div class='comment-control-content'>
                <span class='comment-control-text' contenteditable="true"></span>
            </div>
            <div class='comment-control-footer'>
                <svg class="icon icon-images"><use xlink:href="#icon-images"></use></svg>
                <svg class="icon icon-play"><use xlink:href="#icon-play"></use></svg>
            </div>`;
  }
}

