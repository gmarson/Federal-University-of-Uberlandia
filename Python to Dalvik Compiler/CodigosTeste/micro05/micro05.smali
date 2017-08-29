.class public Lmicro05;
.super Ljava/lang/Object;
.source "micro05.java"


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
    .registers 14

    .prologue
    .line 7
    move-object v0, p0

    new-instance v9, Ljava/util/Scanner;

    move-object v12, v9

    move-object v9, v12

    move-object v10, v12

    sget-object v11, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v10, v11}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    move-object v1, v9

    .line 8
    const/4 v9, 0x0

    move v2, v9

    const/4 v9, 0x0

    move v3, v9

    const/4 v9, 0x0

    move v4, v9

    .line 11
    const/4 v9, 0x0

    move v2, v9

    :goto_14
    move v9, v2

    const/4 v10, 0x5

    if-ge v9, v10, :cond_70

    .line 12
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v10, "Digite o nome: "

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 13
    move-object v9, v1

    invoke-virtual {v9}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v9

    move-object v5, v9

    .line 14
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v10, "H - Homem ou M - Mulher"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 15
    move-object v9, v1

    invoke-virtual {v9}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v9

    move-object v6, v9

    .line 17
    move-object v9, v6

    move-object v7, v9

    const/4 v9, -0x1

    move v8, v9

    move-object v9, v7

    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    move-result v9

    sparse-switch v9, :sswitch_data_b6

    :cond_3e
    :goto_3e
    move v9, v8

    packed-switch v9, :pswitch_data_c0

    .line 25
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v10, "Sexo so pode ser H ou M!"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 11
    :goto_49
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 17
    :sswitch_4c
    move-object v9, v7

    const-string v10, "H"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3e

    const/4 v9, 0x0

    move v8, v9

    goto :goto_3e

    :sswitch_58
    move-object v9, v7

    const-string v10, "M"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3e

    const/4 v9, 0x1

    move v8, v9

    goto :goto_3e

    .line 19
    :pswitch_64
    move v9, v3

    const/4 v10, 0x1

    add-int/lit8 v9, v9, 0x1

    move v3, v9

    .line 20
    goto :goto_49

    .line 22
    :pswitch_6a
    move v9, v4

    const/4 v10, 0x1

    add-int/lit8 v9, v9, 0x1

    move v4, v9

    .line 23
    goto :goto_49

    .line 29
    :cond_70
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    move-object v12, v10

    move-object v10, v12

    move-object v11, v12

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Foram inseridos "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move v11, v3

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " Homens"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 30
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    move-object v12, v10

    move-object v10, v12

    move-object v11, v12

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Foram inseridas "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move v11, v4

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " Mulheres"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 31
    return-void

    .line 17
    nop

    :sswitch_data_b6
    .sparse-switch
        0x48 -> :sswitch_4c
        0x4d -> :sswitch_58
    .end sparse-switch

    :pswitch_data_c0
    .packed-switch 0x0
        :pswitch_64
        :pswitch_6a
    .end packed-switch
.end method
