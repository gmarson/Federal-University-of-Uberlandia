.class public Lmicro11;
.super Ljava/lang/Object;
.source "micro11.java"


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
    .registers 9

    .prologue
    .line 7
    move-object v0, p0

    new-instance v4, Ljava/util/Scanner;

    move-object v7, v4

    move-object v4, v7

    move-object v5, v7

    sget-object v6, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v5, v6}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    move-object v1, v4

    .line 8
    const/4 v4, 0x0

    move v2, v4

    .line 9
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Digite um numero: "

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 10
    move-object v4, v1

    invoke-virtual {v4}, Ljava/util/Scanner;->nextInt()I

    move-result v4

    move v2, v4

    .line 11
    move v4, v2

    invoke-static {v4}, Lmicro11;->verifica(I)I

    move-result v4

    move v3, v4

    .line 12
    move v4, v3

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2d

    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Numero Positivo"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 16
    :goto_2c
    return-void

    .line 13
    :cond_2d
    move v4, v3

    if-nez v4, :cond_38

    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Zero"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2c

    .line 14
    :cond_38
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Numero Negativo"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2c
.end method

.method public static verifica(I)I
    .registers 4

    .prologue
    .line 20
    move v0, p0

    move v2, v0

    if-lez v2, :cond_9

    const/4 v2, 0x1

    move v1, v2

    .line 25
    :goto_6
    move v2, v1

    move v0, v2

    return v0

    .line 21
    :cond_9
    move v2, v0

    if-gez v2, :cond_f

    const/4 v2, -0x1

    move v1, v2

    goto :goto_6

    .line 22
    :cond_f
    const/4 v2, 0x0

    move v1, v2

    goto :goto_6
.end method
