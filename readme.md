## Setup a new Java sc project

1. Create sc folder `mkdir ./sc`
2. Create `sc.yaml' with the following content
```yaml
module: ""
language: "java"
importPathSeparator: "."
enableFileCapitalization: true
forceUnitSetupRegeneration: true
ctlDir: "src/controller"
templates:
- dir: "sc/templates"
imports:
- repoOwner: "SoenkeD"
  repoName: "sc-java-templates"
  repoPath: "sc/templates/"
  localPath: "sc/templates/"
```

3. Create controller folder `mkdir -p ./src/controller/myctl`
4. Create PlantUML file `./src/controller/myctl/myctl.plantuml`
(must have the same name as the controller) with the following content
```
@startuml Demo

[*] --> DemoState: [ !CheckAlwaysTrue ]
[*] -[bold]-> [*]: / Print(The guards needs to be implemented)

DemoState: do / AddMsg(Hello)
DemoState: do / AddMsg(World1)
DemoState: do / AddMsg(!)
DemoState --> BurnState: [ CheckAlwaysTrue ] / Print(Go to BurnState)
DemoState -[bold]-> [*]


BurnState: do / Print(Got messages)
BurnState: do / PrintMsgs
BurnState -[bold]-> [*]
```
5. (optional) Create a Makefile with the following content
```
sc=~/go/bin/sc

.PHONY: sc
sc:
	$(sc) gen --root $(PWD) --name myctl

.PHONY: export
export:
	$(sc) export --root $(PWD)

.PHONY: compile
compile:
	javac -d bin src/*.java

.PHONY: run
run:
	java -cp ./bin src/Main


.PHONY: exec
exec: compile run
```

6. Create `src/Main.java` with the following content
```java
package src;

import src.controller.myctl.Initctl;
import src.controller.myctl.controller.*;

public class Main {
    public static void main(String[] args) {

            Ctl ctl = Initctl.initCtl();
            Reconciler reconciler = new Reconciler(
                ctl, 
                new ReconcilerInput()
                );


            try {
                reconciler.reconcile();
            } catch (CtlErr e) {
                System.err.println(e);
            }
            
    }
}
```
7. Generate the state machine by running `make sc`
8. Execute your first running state machine with `make exec`
9. Implement at least the Print action in `src/controller/myctl/actions/Print.java`