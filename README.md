
## About the project
Riverpod is a library that alleviates such state management problems. It is similar to the Provider library but more flexible and powerful. In Riverpod, global variables are derived from the ChangeNotifier or StateNotifier classes and a global provider is created. These providers can be used without being dependent on the widget tree. By using ref, we can monitor the values ​​of these providers and ensure that the relevant widgets are recreated when there are changes.







  
## 




  
## Riverpod: Access to Data

```bash
  ref.watch: It monitors the value of a provider and displays the corresponding widget when changes occur
```

```bash
  ref.read  :It reads a provider's value once, but does not track changes.
```

```bash
  ref.listen :Specifies a callback function that is triggered when a provider's value changes.
```


  

## Provider Types
```bash
  It provides different provider types such as ChangeNotifierProvider and StateNotifierProvider. These providers are used to provide data to different parts of the application
```

## Value Classes
```bash
  StateNotifier: Generally used to manage immutable data. A StateNotifier-derived class typically manages a single variable and contains methods that define how to update that variable.
```
```bash
  ChangeNotifier: Used to manage mutable data. A ChangeNotifier derived class can handle multiple pieces of data and contains methods that define how to update that data.
```





  
## Destek

Destek için elcierenn@gmail.com adresine e-posta gönderin 

  
