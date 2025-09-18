{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<section id="dog-car-game"
    class="dog-car-game"
    role="region"
    aria-label="{$gameTitle|escape:'htmlall':'UTF-8'}"
    data-message-ready="{$messages.ready|escape:'htmlall':'UTF-8'}"
    data-message-jump="{$messages.jumpHint|escape:'htmlall':'UTF-8'}"
    data-message-game-over="{$messages.gameOver|escape:'htmlall':'UTF-8'}"
    data-message-new-best="{$messages.newBest|escape:'htmlall':'UTF-8'}"
    data-message-resume="{$messages.resume|escape:'htmlall':'UTF-8'}"
    data-start-label="{$startLabel|escape:'htmlall':'UTF-8'}"
    data-restart-label="{$restartLabel|escape:'htmlall':'UTF-8'}"
>
  <div class="dog-car-game__header">
    <h2 class="dog-car-game__title">{$gameTitle|escape:'htmlall':'UTF-8'}</h2>
    <p class="dog-car-game__instructions">
      {$messages.jumpHint|escape:'htmlall':'UTF-8'}
    </p>
  </div>

  <div class="dog-car-game__scoreboard" role="status">
    <div class="dog-car-game__score">
      <span class="dog-car-game__score-label">{l s='Puntuación' d='Modules.CategoryWiseProducts.Shop'}</span>
      <span class="dog-car-game__score-value" data-game-score>0</span>
    </div>
    <div class="dog-car-game__score">
      <span class="dog-car-game__score-label">{l s='Mejor' d='Modules.CategoryWiseProducts.Shop'}</span>
      <span class="dog-car-game__score-value" data-game-best>0</span>
    </div>
    <button type="button" class="dog-car-game__button" data-game-start>
      {$startLabel|escape:'htmlall':'UTF-8'}
    </button>
  </div>

  <div class="dog-car-game__message" aria-live="polite" data-game-message>
    {$messages.ready|escape:'htmlall':'UTF-8'}
  </div>

  <div class="dog-car-game__canvas-wrapper">
    <canvas id="dogCarGameCanvas"
        width="640"
        height="240"
        role="img"
        aria-label="{l s='Perro esquivando coches' d='Modules.CategoryWiseProducts.Shop'}"
        tabindex="0"
    >
      {l s='Tu navegador no soporta el lienzo del juego.' d='Modules.CategoryWiseProducts.Shop'}
    </canvas>
  </div>
</section>

<style>
.dog-car-game {
  margin: 2rem auto;
  max-width: 780px;
  background: linear-gradient(180deg, #ffffff 0%, #f4f8fb 100%);
  border-radius: 18px;
  padding: 2rem;
  box-shadow: 0 25px 55px rgba(23, 50, 95, 0.18);
  border: 1px solid #dce6f4;
  position: relative;
  overflow: hidden;
}

.dog-car-game__header {
  text-align: center;
  margin-bottom: 1.5rem;
}

.dog-car-game__title {
  font-size: 2rem;
  font-weight: 700;
  color: #1f3557;
  margin-bottom: 0.5rem;
}

.dog-car-game__instructions {
  margin: 0 auto;
  max-width: 520px;
  color: #48607a;
}

.dog-car-game__scoreboard {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  gap: 1rem 2rem;
  margin-bottom: 1.5rem;
}

.dog-car-game__score {
  background: rgba(255, 255, 255, 0.9);
  border-radius: 12px;
  padding: 0.75rem 1.25rem;
  box-shadow: 0 10px 25px rgba(24, 54, 92, 0.08);
  text-align: center;
  min-width: 120px;
}

.dog-car-game__score-label {
  display: block;
  font-size: 0.85rem;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  color: #5b7189;
}

.dog-car-game__score-value {
  display: block;
  font-size: 1.6rem;
  font-weight: 700;
  color: #1c3b63;
}

.dog-car-game__button {
  background: linear-gradient(135deg, #ff9800 0%, #ff5722 100%);
  color: #fff;
  border: none;
  border-radius: 999px;
  padding: 0.85rem 2.5rem;
  font-weight: 600;
  letter-spacing: 0.05em;
  box-shadow: 0 12px 25px rgba(255, 120, 48, 0.35);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  cursor: pointer;
}

.dog-car-game__button[disabled] {
  opacity: 0.7;
  cursor: not-allowed;
  box-shadow: none;
}

.dog-car-game__button:not([disabled]):hover,
.dog-car-game__button:not([disabled]):focus {
  transform: translateY(-2px);
  box-shadow: 0 18px 35px rgba(255, 120, 48, 0.45);
  outline: none;
}

.dog-car-game__message {
  text-align: center;
  font-size: 1rem;
  margin-bottom: 1.5rem;
  color: #2d4668;
  min-height: 1.5rem;
}

.dog-car-game__canvas-wrapper {
  position: relative;
  border-radius: 16px;
  overflow: hidden;
  background: linear-gradient(180deg, #bde5ff 0%, #dff1ff 55%, #ffffff 100%);
  border: 1px solid rgba(23, 60, 94, 0.15);
  box-shadow: inset 0 1px 8px rgba(11, 49, 94, 0.2);
}

#dogCarGameCanvas {
  width: 100%;
  height: auto;
  display: block;
}

@media (max-width: 768px) {
  .dog-car-game {
    padding: 1.5rem;
  }

  .dog-car-game__title {
    font-size: 1.6rem;
  }

  .dog-car-game__scoreboard {
    gap: 0.75rem 1.25rem;
  }

  .dog-car-game__score {
    min-width: 110px;
  }
}
</style>

<script>
(function () {
  const container = document.getElementById('dog-car-game');
  if (!container || container.dataset.initialized === 'true') {
    return;
  }
  container.dataset.initialized = 'true';

  const canvas = container.querySelector('#dogCarGameCanvas');
  if (!canvas || typeof canvas.getContext !== 'function') {
    return;
  }

  const ctx = canvas.getContext('2d');
  if (!ctx) {
    return;
  }

  const startButton = container.querySelector('[data-game-start]');
  const scoreEl = container.querySelector('[data-game-score]');
  const bestScoreEl = container.querySelector('[data-game-best]');
  const messageEl = container.querySelector('[data-game-message]');

  const readyMessage = container.dataset.messageReady || '';
  const jumpHintMessage = container.dataset.messageJump || '';
  const gameOverMessage = container.dataset.messageGameOver || '';
  const newBestMessage = container.dataset.messageNewBest || '';
  const resumeMessage = container.dataset.messageResume || '';
  const startLabel = container.dataset.startLabel || 'Start';
  const restartLabel = container.dataset.restartLabel || startLabel;

  const highScoreKey = 'dogCarGameHighScore';

  let running = false;
  let gameOver = false;
  let animationFrameId = null;

  const groundY = canvas.height - 32;
  const gravity = 1600;
  const jumpVelocity = 620;

  let dog;
  let cars;
  let score;
  let lastTime;
  let spawnTimer;
  let speed;
  let highScore = 0;

  function loadHighScore() {
    try {
      const stored = parseInt(window.localStorage.getItem(highScoreKey), 10);
      highScore = Number.isFinite(stored) ? Math.max(0, stored) : 0;
    } catch (error) {
      highScore = 0;
    }
    bestScoreEl.textContent = String(highScore);
  }

  function resetActors() {
    dog = {
      x: 70,
      y: groundY,
      width: 54,
      height: 36,
      velocity: 0,
      jumping: false,
    };
    cars = [];
    score = 0;
    spawnTimer = 0;
    speed = 260;
    lastTime = undefined;
  }

  function setMessage(text) {
    if (messageEl) {
      messageEl.textContent = text;
    }
  }

  function drawBackground() {
    const gradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
    gradient.addColorStop(0, '#b9e6ff');
    gradient.addColorStop(0.65, '#dff0ff');
    gradient.addColorStop(1, '#ffffff');
    ctx.fillStyle = gradient;
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    const roadTop = groundY - 6;
    ctx.fillStyle = '#5b6f82';
    ctx.fillRect(0, roadTop, canvas.width, canvas.height - roadTop);

    ctx.fillStyle = '#364353';
    ctx.fillRect(0, groundY + 8, canvas.width, canvas.height - (groundY + 8));

    ctx.fillStyle = '#d9e4ec';
    for (let i = 0; i < canvas.width; i += 70) {
      ctx.fillRect(i + 12, groundY + 6, 28, 4);
    }
  }

  function drawDog() {
    const dogTop = dog.y - dog.height;

    ctx.fillStyle = '#5d4037';
    ctx.fillRect(dog.x - 10, dog.y - 18, 14, 6);

    ctx.fillStyle = '#6d4c41';
    ctx.fillRect(dog.x, dogTop + 12, dog.width * 0.7, dog.height - 12);

    ctx.fillStyle = '#8d6e63';
    ctx.fillRect(dog.x + dog.width * 0.6, dogTop + 6, dog.width * 0.45, dog.height - 8);

    ctx.fillStyle = '#4e342e';
    ctx.fillRect(dog.x + dog.width * 0.62, dogTop - 4, 12, 12);

    ctx.fillStyle = '#ffffff';
    ctx.fillRect(dog.x + dog.width * 0.78, dogTop + 14, 7, 7);
    ctx.fillStyle = '#212121';
    ctx.fillRect(dog.x + dog.width * 0.81, dogTop + 16, 3, 3);

    ctx.fillStyle = '#d7ccc8';
    ctx.fillRect(dog.x + dog.width * 0.88, dogTop + dog.height - 16, 9, 10);

    ctx.fillStyle = '#4e342e';
    ctx.fillRect(dog.x + 6, dog.y - 6, 6, 6);
    ctx.fillRect(dog.x + 20, dog.y - 6, 6, 6);
    ctx.fillRect(dog.x + 34, dog.y - 6, 6, 6);
  }

  function drawCars() {
    cars.forEach((car) => {
      const carTop = groundY - car.height;

      ctx.fillStyle = car.color;
      ctx.fillRect(car.x, carTop, car.width, car.height - 6);

      ctx.fillStyle = '#37474f';
      ctx.fillRect(car.x + 6, carTop + car.height - 6, car.width - 12, 6);

      ctx.fillStyle = '#ffc400';
      ctx.fillRect(car.x + car.width * 0.15, carTop + 8, car.width * 0.25, 12);
      ctx.fillStyle = '#ffecb3';
      ctx.fillRect(car.x + car.width - 14, carTop + car.height - 18, 10, 6);

      ctx.fillStyle = '#212121';
      ctx.beginPath();
      ctx.arc(car.x + 16, groundY + 2, 8, 0, Math.PI * 2);
      ctx.arc(car.x + car.width - 16, groundY + 2, 8, 0, Math.PI * 2);
      ctx.fill();

      ctx.fillStyle = '#90a4ae';
      ctx.beginPath();
      ctx.arc(car.x + 16, groundY + 2, 4, 0, Math.PI * 2);
      ctx.arc(car.x + car.width - 16, groundY + 2, 4, 0, Math.PI * 2);
      ctx.fill();
    });
  }

  function drawScene() {
    drawBackground();
    drawCars();
    drawDog();
  }

  function spawnCar() {
    const carHeight = 26 + Math.random() * 20;
    const carWidth = 60 + Math.random() * 28;
    const hues = [10, 28, 200, 150, 330];
    const hue = hues[Math.floor(Math.random() * hues.length)];
    cars.push({
      x: canvas.width + carWidth,
      width: carWidth,
      height: carHeight,
      color: `hsl(${hue}, 75%, 55%)`,
    });
  }

  function update(delta) {
    dog.velocity += gravity * delta;
    dog.y += dog.velocity * delta;
    if (dog.y > groundY) {
      dog.y = groundY;
      dog.velocity = 0;
      dog.jumping = false;
    }

    spawnTimer += delta * 1000;
    const spawnThreshold = Math.max(450, 1300 - score * 2.5);
    if (spawnTimer > spawnThreshold) {
      spawnCar();
      spawnTimer = 0;
      speed = Math.min(520, speed + 8);
    }

    for (let i = cars.length - 1; i >= 0; i -= 1) {
      const car = cars[i];
      car.x -= speed * delta;
      if (car.x + car.width < -20) {
        cars.splice(i, 1);
      }
    }

    const dogTop = dog.y - dog.height;
    const dogBottom = dog.y;
    const dogLeft = dog.x;
    const dogRight = dog.x + dog.width;

    for (let i = 0; i < cars.length; i += 1) {
      const car = cars[i];
      const carTop = groundY - car.height;
      const carBottom = groundY;
      const carLeft = car.x;
      const carRight = car.x + car.width;

      if (dogRight > carLeft && dogLeft < carRight && dogBottom > carTop && dogTop < carBottom) {
        triggerGameOver();
        return;
      }
    }

    score += delta * 100;
    scoreEl.textContent = String(Math.floor(score));
  }

  function loop(timestamp) {
    if (!running) {
      return;
    }

    if (lastTime === undefined) {
      lastTime = timestamp;
    }

    const delta = Math.min((timestamp - lastTime) / 1000, 0.05);
    lastTime = timestamp;

    update(delta);
    drawScene();

    if (running) {
      animationFrameId = window.requestAnimationFrame(loop);
    }
  }

  function performJump() {
    if (!dog.jumping) {
      dog.velocity = -jumpVelocity;
      dog.jumping = true;
    }
  }

  function triggerGameOver() {
    if (!running) {
      return;
    }

    running = false;
    gameOver = true;
    if (animationFrameId) {
      window.cancelAnimationFrame(animationFrameId);
    }

    const finalScore = Math.floor(score);
    let stored = highScore;

    try {
      stored = parseInt(window.localStorage.getItem(highScoreKey), 10);
      stored = Number.isFinite(stored) ? Math.max(0, stored) : 0;
    } catch (error) {
      stored = highScore;
    }

    if (finalScore > stored) {
      highScore = finalScore;
      try {
        window.localStorage.setItem(highScoreKey, String(highScore));
      } catch (error) {
        // Ignore storage write errors.
      }
      bestScoreEl.textContent = String(highScore);
      setMessage(`${gameOverMessage} ${newBestMessage}`.trim());
    } else {
      highScore = stored;
      bestScoreEl.textContent = String(highScore);
      setMessage(`${gameOverMessage} ${resumeMessage}`.trim());
    }

    if (startButton) {
      startButton.textContent = restartLabel;
      startButton.removeAttribute('disabled');
      startButton.focus({ preventScroll: true });
    }
  }

  function startGame(jumpAfterStart) {
    resetActors();
    running = true;
    gameOver = false;
    scoreEl.textContent = '0';
    setMessage(jumpHintMessage);
    if (startButton) {
      startButton.textContent = restartLabel;
      startButton.setAttribute('disabled', 'disabled');
    }
    drawScene();
    animationFrameId = window.requestAnimationFrame(loop);
    if (jumpAfterStart) {
      performJump();
    }
  }

  function prepareGame() {
    resetActors();
    running = false;
    gameOver = false;
    scoreEl.textContent = '0';
    setMessage(`${readyMessage} ${jumpHintMessage}`.trim());
    if (startButton) {
      startButton.textContent = startLabel;
      startButton.removeAttribute('disabled');
    }
    drawScene();
  }

  function requestJump() {
    if (gameOver) {
      startGame(true);
      return;
    }

    if (!running) {
      startGame(true);
      return;
    }

    performJump();
  }

  if (startButton) {
    startButton.addEventListener('click', function () {
      if (running) {
        return;
      }
      startGame(false);
    });
  }

  window.addEventListener('keydown', function (event) {
    if (event.key === ' ' || event.key === 'Spacebar' || event.key === 'ArrowUp' || event.key === 'w' || event.key === 'W') {
      event.preventDefault();
      requestJump();
    }
  });

  canvas.addEventListener('pointerdown', function (event) {
    event.preventDefault();
    requestJump();
  });

  canvas.addEventListener('touchstart', function (event) {
    event.preventDefault();
    requestJump();
  }, { passive: false });

  loadHighScore();
  prepareGame();
})();
</script>
