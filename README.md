# lanes_planes_demo

A simple demo app as a challenge task for LanesPLanes.

<img src="https://i1.wp.com/resocoder.com/wp-content/uploads/2019/08/CleanArchitecture.jpg" alt="Clean Architecture" width="750"/>

# Final Architecture

<img src="https://i1.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png">

## Required Folder Structure.
```
├───lib/
│   ├───core/
│   ├───features/
│   │   ├───home/
│   │       ├───.....
│   │   ├───stops/
│   │       ├───.....
│   │   └───departures/
│   │       ├───data/
│   │       │   ├───datasources/
│   │       │   ├───models/
│   │       │   └───repositories/
│   │       ├───domain/
│   │       │   ├───entities/
│   │       │   └───repositories/
│   │       │   └───usecases/
│   │       └───presentation/
│   │           ├───providers/
│   │           ├───pages/
│   │           └───widgets/
.   └───main.dart
```

Simple Demonstration of Folder Structure as per Clean Architecture
