# corona

## Usage

First we must declare our interfaces using abstract classes.
These interfaces are very straightforward, simply define your properties as getters:

```dart
    /// declare a library name
    library declaration_object;
    
    /// required!
    import 'package:corona/corona.dart';
    
    /// manually place this line, this file will be built at a later point,
    /// so ignore the missing file error for now
    part 'declaration_objects.g.dart';
    
    abstract class Country {
      String get name;
    }
    
    abstract class Address {
      String get street;
      int get number;
      String get postalCode;
      Country get country;
    }
    
    abstract class Person {
      String get name;
      Address get address;
    }
```

Next, we need to run the build job 

Thanks to a build step, we can greatly simplify the way the lens works.

```dart
    // Let's create an Immutable [Person] object.
    // However, we only have the Person abstract class, which is impossible
    // to create an instance from.
    //
    // Instead, we use the generated factory method, providing as with
    // a (generated as well) immutable implementation of Person
    Person person = PersonFactory.create();
    
    // As a simple test, let's access a property
    print(person.address.country.name); // outputs: 'Belgium'
    
    // However, who wants to live in Belgium of all places anyway?
    // Let's use a lens to create a new immutable [Person], but with a
    // different country name!
    Person relocatedPerson = personLens(person, (schema) => schema.address.country.name, (_) => 'Bahamas');
    
    print(relocatedPerson.address.country.name); // outputs: 'Bahamas'
    
    // Some info on the above:
    // the [personLens] method is generated,
    // it is strongly types and takes:
    // - a [Person] instance,
    // - a method which locates the property we want to update
    //   the [schema] object is a representation of the [Person] object,
    //   however instead of returning property values, it returns an [ObjectSchema]
    //   to the internal lens function, which is uses to locate the property we target
    //   as a bonus, the schema is Type aware, so if you return schema.address.country.name
    //   like the example does, then the value function next must return a String
    // - a method which recieves the current value, and returns the new value
```
