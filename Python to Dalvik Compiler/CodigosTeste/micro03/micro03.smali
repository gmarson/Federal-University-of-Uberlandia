.class public Lmicro03;
.super Ljava/lang/Object;
.source "micro03.java"


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
    .registers 8

    .prologue
    .line 7
    move-object v0, p0

    new-instance v3, Ljava/util/Scanner;

    move-object v6, v3

    move-object v3, v6

    move-object v4, v6

    sget-object v5, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v4, v5}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    move-object v1, v3

    .line 9
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Digite um numero: "

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 10
    move-object v3, v1

    invoke-virtual {v3}, Ljava/util/Scanner;->nextInt()I

    move-result v3

    move v2, v3

    .line 12
    move v3, v2

    const/16 v4, 0x64

    if-lt v3, v4, :cond_33

    .line 14
    move v3, v2

    const/16 v4, 0xc8

    if-gt v3, v4, :cond_2b

    .line 15
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "O numero esta no intervalo entre 100 e 200"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 21
    :goto_2a
    return-void

    .line 17
    :cond_2b
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "O numero nao esta no intervalo entre 100 e 200"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2a

    .line 20
    :cond_33
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "O numero nao esta no intervalo entre 100 e 200"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2a
.end method
