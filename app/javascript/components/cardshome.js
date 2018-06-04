    NodeList.prototype.map = Array.prototype.map;
    NodeList.prototype.filter = Array.prototype.filter;
    NodeList.prototype.forEach = Array.prototype.forEach;

    const section = document.querySelector('.carousel');
    const elements = document.querySelectorAll('.carousel-item');

    const elementsLength = elements.length;
    const middleElementPosition = Math.ceil(elementsLength / 2)
  function cardsFunction() {

    elements.forEach(element => element.addEventListener('click', event => {
        const position = parseInt(element.dataset.position);
        let clickPos = position;
        const dirVal = (clickPos > middleElementPosition) ? -1 : 1;

        if (position === middleElementPosition) return;

        while (clickPos != middleElementPosition) {
            elements.forEach(child => {
                const childPosition = parseInt(child.dataset.position);
                const nextPos = childPosition + dirVal;
                if (position < middleElementPosition) {
                    child.dataset.position = (nextPos > elementsLength) ? 1 : nextPos;
                } else {
                    child.dataset.position = (nextPos < 1) ? elementsLength : nextPos;
                }
            });
            clickPos += dirVal;
        }
    }));
  }

export { cardsFunction };
