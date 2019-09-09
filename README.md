# fun_arch_todo_flutter

This repository contains a reference implementation of the Flutter architecture. The general approach is based on [the ReduRx implementation](https://github.com/felangel/flutter_architecture_samples/tree/master/redurx) but with some modifications.

## Key Points
* _ActionFunctions_ are used for triggering changes in the application state - combination of 'action' and 'reducer' in the same function
* Lenses are utilized for deep modifications of the immutable Application State (instead of combining reducers redux style).
* Changes in the state are propagated to UI Widgets by use of the "ConnectState" widget. Re-rendering of the widgets is triggered automatically when the sub-state that a widget is subscribed to changes.

### Details
The app implementation adheres to the following principles:
- `AppState` is the root of the application state.
- Each object that is part of the state hierarchy (sub-state object) is immutable and implements a `copyWith` function.
- If an initial state is required for initialization, an `initial()` factory method is provided by the class.
- `null` values are not allowed for the properties of the state/sub-state objects. If a value can be null, `Maybe` type is used.
- `AppStore` is the container of the `AppState` and exposes:
    - `state` - current version of the app state
    - `state$` - `Observable<AppState>` - representation of the state changes over time
    - `dispath(ActionFunction)` 
- An `ActionFunction` is a combination of _Action_ and the _Reducer_ in one function. Any function with signature  `AppState -> AppState` can be used as an `ActionFunction`.
- `ActionFunctions` are always synchronous and used only to modify the state/sub-state. _It is possible to use asynchronous versions of `ActionFunction` and `dispatch` to represent a asynchronous calls but we find it "cleaner" to use Actions only to update and delegate any logic and data fetching to regular service methods_
- For asynchronous functionality of fetching and manipulating data, a special `Fetcher` service is used.
    - Fetcher methods are responsible for calling `Store::dispatch(...)` method before (if needed) and after fetching and preparing the data to update the state.
    - Fetcher methods return `Future<>` to allow the caller of the fetch methods (usually UI components) to handle success or failure of the fetch calls to make "Navigation Decisions".
    
