# fun_arch_todo_flutter

Reference implementation of the Flutter architecture successfully used in production.
General approach is based on [the ReduRx implementation](https://github.com/felangel/flutter_architecture_samples/tree/master/redurx) but with some modification

## Key Points
* 'ActionFunctions' used for triggering changes in the application state - combination of 'action' and 'reducer' in the same function
* Utilizes lenses for deep modifications of the immutable Application State (Instead of combining reducers redux style)
* Changes in the state are propagated in to UI Widgets by use of "ConnectState" widget. Re rendering of the widgets triggered automatically when sub-state that widget is subscribed to changes  

### Details
Those are principals that we flow for the app implementation
- `AppState` contains all application state
- each object that is part of the state hierarchy is immutable and implements `copyWith` function and `initial()` factory.
- no null values allowed for the properties of the state/sub-state objects. If value can be null `Maybe` type is used
- `AppStore` is the container of the `AppState` it is globally accessible and exposes:
    - `state` - current version of the app state
    - `state$` - `Observable<AppState>` - representation of the state changes over time
    - `dispath(ActionFunction)` 
- `ActionFunction` is a combination of _Action_ and the _Reducer_ in one function any function with signature  `AppState -> AppState` can be used as an ActionFunction
- `ActionFunctions` are always synchronous and used  only to modify the state/sub-state
_(Potentially Asynchronous version of `ActtionFunction` and `dispatch` method can be used to represent a asynchronous calls but we find it "cleaner" to only use dispatch actions for state updates. And delegate any  other application logic and data fetching to regular service methods)_
- For asynchronous functionality of fetching and manipulating the data a special `Fettcher` service is used.
    - Fetcher methods are responsible for  calling `Store::dispatch(...)` method before (if needed) and after fetching and preparing the data to update the state.
    - Fetcher methods return `Future<>` to allow the caller of the fetch methods (usually UI components) to handle successes and errors of the fetch calls to make "Navigation Decisions".
    
