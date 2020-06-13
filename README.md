# fun_arch_todo_flutter

This repository contains a reference implementation of the Flutter state management architecture. It uses centralized application State managed by the Store. (Redux like approach but without reducers).
 It does not use BLoC or Provider patents.  

### Details
The app implementation adheres to the following principles:
- `AppState` is the root of the application state.
- Each object that is part of the state hierarchy (sub-state object) is immutable and implements a `copyWith` function.
- If an initial state is required for initialization, an `initial()` factory method is provided by the class.
- `null` values are not allowed for the properties of the state/sub-state objects. If a value can be null, `Maybe` type is used.
- `AppStore` is the container of the `AppState` it is globally accessible and exposes:
    - `state` - current version of the app state
    - `state$` - `Observable<AppState>` - representation of the state changes over time
    - `dispath(ActionFunction)` 
- State can be modified by calling Store.dispatch(...) function passing Action as a parameter
- There are two reference implementations of the Actions 1) as a regular Classs (ActionClass) that implements updateState AppState->AppState that returns modified version of the state.  
- `Actions` are always synchronous and used only to modify the state/sub-state.
- For asynchronous functionality of fetching and manipulating the data a special `Fettcher` service is used.
    - Fetcher methods are responsible for calling `Store::dispatch(...)` method before (if needed) and after fetching and preparing the data to update the state.
    - Fetcher methods return `Future<>` to allow the caller of the `fetch` methods (usually UI components) to handle success or failure of the `fetch` calls to make "Navigation Decisions".
- `ConnectState` widget is used to control the rendering (build(..)) of the UI Components (Widgets) by subscribing to changes of the parts of the AppState relevant to the Component.
    
