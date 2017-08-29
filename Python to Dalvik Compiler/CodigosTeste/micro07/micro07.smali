.class public Lmicro07;
.super Ljava/lang/Object;
.source "micro07.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 3
    move-object v0, p0

    move-object v1, v0

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 10

    .prologue
    .line 7
    move-object v0, p0

    new-instance v5, Ljava/util/Scanner;

    move-object v8, v5

    move-object v5, v8

    move-object v6, v8

    sget-object v7, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v6, v7}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    move-object v1, v5

    .line 8
    const/4 v5, 0x0

    move v2, v5

    const/4 v5, 0x1

    move v3, v5

    .line 10
    :cond_10
    :goto_10
    move v5, v3

    const/4 v6, 0x1

    if-ne v5, v6, :cond_5a

    .line 11
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "Digite um n\u00famero: "

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 12
    move-object v5, v1

    invoke-virtual {v5}, Ljava/util/Scanner;->nextInt()I

    move-result v5

    move v2, v5

    .line 14
    move v5, v2

    if-lez v5, :cond_45

    .line 15
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "Positivo"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 23
    :cond_2b
    :goto_2b
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "Deseja Finalizar? (S/N) "

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 24
    move-object v5, v1

    invoke-virtual {v5}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    move v4, v5

    .line 25
    move v5, v4

    const/16 v6, 0x53

    if-ne v5, v6, :cond_10

    .line 26
    const/4 v5, 0x0

    move v3, v5

    goto :goto_10

    .line 18
    :cond_45
    move v5, v2

    if-nez v5, :cond_4f

    .line 19
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "O numero e igual a 0"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 20
    :cond_4f
    move v5, v2

    if-gez v5, :cond_2b

    .line 21
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "Negativo"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2b

    .line 28
    :cond_5a
    return-void
.end method
