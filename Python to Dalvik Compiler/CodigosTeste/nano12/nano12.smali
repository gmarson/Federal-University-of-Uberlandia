.class public Lnano12;
.super Ljava/lang/Object;
.source "nano12.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 1
    move-object v0, p0

    move-object v1, v0

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 7

    .prologue
    .line 6
    move-object v0, p0

    const/4 v4, 0x1

    move v1, v4

    .line 7
    const/4 v4, 0x2

    move v2, v4

    .line 8
    const/4 v4, 0x5

    move v3, v4

    .line 9
    :goto_7
    move v4, v3

    move v5, v1

    if-le v4, v5, :cond_22

    .line 11
    move v4, v1

    move v5, v2

    if-ne v4, v5, :cond_1b

    .line 13
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move v5, v1

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->print(I)V

    .line 19
    :goto_15
    move v4, v3

    const/4 v5, 0x1

    add-int/lit8 v4, v4, -0x1

    move v3, v4

    goto :goto_7

    .line 17
    :cond_1b
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->print(I)V

    goto :goto_15

    .line 21
    :cond_22
    return-void
.end method
