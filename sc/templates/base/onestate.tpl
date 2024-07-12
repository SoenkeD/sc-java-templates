{{- $stateName := .Name -}}

{{- if or (eq $stateName "Start") (eq $stateName "End" ) -}}
    {{- $stateName = printf "%s%s" .Name "State" -}}
{{- end -}}

State {{ $stateName }}= new State();

{{- range $idx, $action := $.State.Actions }}

    StateAction {{ $stateName }}{{ $idx }}Action = new StateAction();
    {{ $stateName }}{{ $idx }}Action.setAction("{{ $action.Action }}Action");

    ArrayList<String> {{ $stateName }}{{ $idx }}ActionArgs = new ArrayList<>();

    {{- range $argIdx, $arg := $action.ActionParams }}
        {{ $stateName }}{{ $idx }}ActionArgs.add("{{ $arg }}");
    {{- end }}

    {{ $stateName }}{{ $idx }}Action.setActionArgs({{ $stateName }}{{ $idx }}ActionArgs);

    {{ $stateName }}.getActions().add({{ $stateName }}{{ $idx }}Action);

{{- end }}

{{- range $idx, $transition := $.State.Transitions }}

    Transition {{ $stateName }}{{ $idx}}Transition = new Transition();

    {{- if ne $transition.Guard "" -}}

        {{ $stateName }}{{ $idx}}Transition.setGuard("{{ $transition.Guard }}");

        ArrayList<String> {{ $stateName }}{{ $idx}}GuardArgs = new ArrayList<>();
        {{- range $argIdx, $arg := $transition.GuardParams }}
            {{ $stateName }}{{ $idx}}GuardArgs.add("{{ $arg }}");
        {{- end }}

        {{ $stateName }}{{ $idx}}Transition.setGuardArgs({{ $stateName }}{{ $idx}}GuardArgs);

    {{- end -}}


    {{- if ne $transition.Action "" -}}

        {{ $stateName }}{{ $idx}}Transition.setAction("{{ $transition.Action }}Action");

        ArrayList<String> {{ $stateName }}{{ $idx}}TransActionArgs = new ArrayList<>();
        {{- range $argIdx, $arg := $transition.ActionParams }}
            {{ $stateName }}{{ $idx}}TransActionArgs.add("{{ $arg }}");
        {{- end }}

        {{ $stateName }}{{ $idx}}Transition.setActionArgs({{ $stateName }}{{ $idx}}TransActionArgs);

    {{- end -}}

    {{ $nextName := $transition.Target }}
    {{- if or (eq $nextName "/Start") (eq $nextName "/End") -}}
        {{- $nextName := printf "%s%s" $nextName "State" -}}
        {{ $stateName }}{{ $idx}}Transition.setNext("{{- replaceAll $nextName "/" "" }}");
    {{- else -}}
        {{ $stateName }}{{ $idx}}Transition.setNext("{{- replaceAll $nextName "/" "" }}");
    {{- end -}}
    
    
    {{ $stateName }}{{ $idx}}Transition.setNegation({{ $transition.Negation }});
    {{ $stateName }}{{ $idx}}Transition.setType(TransitionType.{{- typesToUpper $transition.Type }});
    {{ $stateName }}.getTransitions().add({{ $stateName }}{{ $idx}}Transition);

{{- end }}

states.put("{{ $stateName }}", {{ $stateName }});

