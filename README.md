<div align="center">
    <h1>VK.me Patcher</h1>
</div>

_VK.me Patcher_ это набор скриптов и утилит для удобной модификации Electron.js приложений (и VK.me в частности). Он позволяет работать не с минифицированными файлами напрямую, а с удобным, структурированным рабочим пространством, специально подготовленном для разработки.

### Зачем это нужно
В связи с текущей ситуацией в мире одним из главных мессенджеров в Россиийской Федерации стал ВКонтакте. Хотя многие более удобные и гибкие мессенджеры всё ещё работают на территории России (например Telegram), они являются иностранными и потому не могут быть официально рекомендованы государством.

Т.к. в VK.me нету нормальной тёмной темы, а поменять цвета не представляется возможным - приходится использовать "тяжёлую артиллерию".

Да и в принципе утилита подойдёт для всего, что основано на Electron.js: Discord, Telegram, даже VSCode.

### Как это использовать
_Patcher_ изолирует надобность прямой модификации исходного кода при помощи рабочих пространств. Чтобы начать использовать всё его удобство - скопируйте этот репозиторий. В директории `scripts` будут лежать полезные скрипты.

Для инициализации нового рабочего пространства запустите `source init_workspace.sh <WORKSPACE PATH> <APP PATH>` (`source` обязателен, можно заменить на `.`). Первым аргументов является путь к новому пространству. Если пространство по заданному пути уже существует, скрипт просто перезадаст переменную VKPATCHER_WORKSPACE. В ином случае скрипт декомпилирует asar файл с места установки `<APP PATH>/resources/app.asar` и создаст правильную структуру папок. Далее исходный код будет деминифицирован. В конечном workspace будет два git репозитория, один в корне, а другой в `src`. `src` это рабочая зона для изменений, Вы не должны публиковать её. После каждого изменения в исходный код делайте commit. Git репозиторий в корне напротив нужен для публикации: по задумке в публичном доступе должны оказаться только файлы из директории `patches`.

Чтобы сверить версию уже созданного workspace и текущей версии скрипта Вы можете запустить `get_version`. По умолчанию он покажет версию текущего выбранного workspace (или ошибку, если workspace не выбран). Если передать аргумент `cli`: `get_version cli` - то скрипт выдаст текущую версию _vk.me patcher_.

После того, как все изменения внесены и нужно сделать релиз Вы можете запустить `build_workspace`. Он сгенерирует патчи по вашим коммитам в `src` и запишет их в директорию `patches` текущего выбранного workspace.

При необходимости применить патчи из рабочего пространства к готовой установке Electron.js запускайте `apply_patches.sh <APP PATH>`. Он применит все патчи из текущего workspace к приложению по заданному `APP PATH`. Если необходимо, можно распаковать .deb файл и применить скрипт к получившимся файлам, а потом заново пересобрать .deb пакет: тогда на выходе получится модифицированный билд приложения.

### TODO
На данный момент скрипт нуждается в добавлении обратной минификации при применении патчей. Но это не сильно влияет на размер конечного бандла, к тому же это Electron, поэтому будет сделано как только появится время.

### Лицензии и благодарности
Проект находится под лицензией MIT.
Отдельная благодарность [JS Beautify](https://github.com/beautify-web/js-beautify) за CLI для деминификации JS, CSS и HTML.
